/* ============================================================
   Motor común de las autoevaluaciones.
   Cada página define antes un objeto CONFIG con sus reglas: de cada
   grupo de preguntas candidatas (pool) se eligen "count" al azar.
   ============================================================ */
(function () {
  let draw = [];     // preguntas del intento actual
  let state = [];    // null = sin responder; true/false = acierto

  /* ---------- Utilidades ---------- */
  function shuffle(list) {
    const a = list.slice();
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
  }

  function numberWord(n) {
    const words = { 5: "Cinco", 6: "Seis", 8: "Ocho", 10: "Diez", 12: "Doce", 15: "Quince", 20: "Veinte" };
    return words[n] || String(n);
  }

  // Elige las preguntas de un intento y baraja sus opciones
  function newDraw() {
    draw = [];
    CONFIG.rules.forEach(rule => {
      shuffle(rule.pool).slice(0, rule.count).forEach(q => {
        if (q.type === "single") {
          const order = shuffle(q.options.map((_, i) => i));
          draw.push({ ...q, options: order.map(i => q.options[i]), answer: order.indexOf(q.answer) });
        } else {
          draw.push({ ...q, items: shuffle(q.items) });
        }
      });
    });
    state = draw.map(() => null);
  }

  /* ---------- Estructura de la página ---------- */
  document.title = `Autoevaluación ${CONFIG.id} · ${CONFIG.title}`;
  const total = CONFIG.rules.reduce((s, r) => s + r.count, 0);
  const app = document.getElementById("app");
  app.innerHTML = `
    <p class="kicker">${CONFIG.block} | Autoevaluación</p>
    <h1>Autoevaluación del subbloque ${CONFIG.id}: ${CONFIG.title}</h1>
    <p class="nav">
      <a href="${CONFIG.readme}">← Volver al índice del curso</a>
      <a href="./">Todas las autoevaluaciones</a>
    </p>
    <p class="intro">
      ${numberWord(total)} preguntas para comprobar si dominamos el subbloque antes de pasar al siguiente.
      Responde cada una sin mirar las guías y pulsa <strong>Comprobar</strong>.
      Si fallas, la corrección te indica qué sesión repasar. Cada intento trae preguntas y opciones en otro orden.
    </p>
    <div class="score" aria-live="polite">
      <span id="progress"></span>
      <div class="bar"><div id="bar"></div></div>
      <span id="hits"></span>
    </div>
    <div id="quiz"></div>
    <section class="result" id="result" aria-live="polite">
      <p class="big" id="final"></p>
      <p id="verdict"></p>
      <button id="again">Otro intento</button>
    </section>
    <footer>Autoevaluación · Subbloque ${CONFIG.id} · ${CONFIG.block} · ${CONFIG.caseName}</footer>`;

  const quiz = document.getElementById("quiz");

  /* ---------- Preguntas ---------- */
  function render() {
    quiz.innerHTML = "";
    draw.forEach((q, i) => {
      const card = document.createElement("section");
      card.className = "q";
      card.innerHTML = `<h2>Pregunta ${i + 1}</h2><p class="stem">${q.stem}</p>`
        + (q.code ? `<pre><code>${q.code}</code></pre>` : "");
      const body = document.createElement("div");

      if (q.type === "single") {
        q.options.forEach((opt, j) => {
          body.insertAdjacentHTML("beforeend",
            `<label class="opt"><input type="radio" name="q${i}" value="${j}"><span>${opt}</span></label>`);
        });
      } else {
        body.className = "match";
        q.items.forEach(([label], j) => {
          const opts = q.choices.map((c, k) => `<option value="${k}">${c.replace(/<[^>]+>/g, "")}</option>`).join("");
          body.insertAdjacentHTML("beforeend",
            `<span>${label}</span><select data-item="${j}"><option value="">Elige…</option>${opts}</select>`);
        });
      }
      card.appendChild(body);

      const actions = document.createElement("div");
      actions.className = "actions";
      const btn = document.createElement("button");
      btn.textContent = "Comprobar";
      btn.disabled = true;
      actions.appendChild(btn);
      card.appendChild(actions);

      // «Comprobar» se activa cuando la pregunta está completa
      body.addEventListener("change", () => {
        btn.disabled = q.type === "single"
          ? !body.querySelector("input:checked")
          : [...body.querySelectorAll("select")].some(s => s.value === "");
      });
      btn.addEventListener("click", () => check(i, card, body, actions));
      quiz.appendChild(card);
    });
    updateScore();
  }

  /* ---------- Corrección ---------- */
  function check(i, card, body, actions) {
    const q = draw[i];
    let ok;
    if (q.type === "single") {
      const chosen = Number(body.querySelector("input:checked").value);
      ok = chosen === q.answer;
      body.querySelectorAll(".opt").forEach((lab, j) => {
        if (j === q.answer) lab.classList.add("correct");
        else if (j === chosen) lab.classList.add("wrong");
      });
    } else {
      ok = true;
      body.querySelectorAll("select").forEach(sel => {
        const right = q.items[Number(sel.dataset.item)][1];
        const good = Number(sel.value) === right;
        sel.classList.add(good ? "correct" : "wrong");
        if (!good) {
          ok = false;
          sel.insertAdjacentHTML("afterend", `<span class="fix">Correcto: ${q.choices[right]}</span>`);
        }
      });
    }
    body.querySelectorAll("input, select").forEach(el => el.disabled = true);

    const review = q.review
      ? `<p>Repasa: <a href="${q.review.url}" target="_blank" rel="noopener">${q.review.label}</a></p>`
      : "";
    card.classList.add(ok ? "ok" : "ko");
    actions.outerHTML = `
      <div class="feedback ${ok ? "ok" : "ko"}">
        <span class="verdict">${ok ? "✓ Correcto" : "✗ No es correcto"}</span>
        <p>${q.explain}</p>
        ${review}
      </div>`;
    state[i] = ok;
    updateScore();
  }

  /* ---------- Marcador y resultado ---------- */
  function updateScore() {
    const answered = state.filter(s => s !== null).length;
    const hits = state.filter(s => s === true).length;
    document.getElementById("progress").textContent = `${answered} de ${total} respondidas`;
    document.getElementById("hits").textContent = `${hits} ${hits === 1 ? "acierto" : "aciertos"}`;
    document.getElementById("bar").style.width = `${(answered / total) * 100}%`;

    const result = document.getElementById("result");
    if (answered === total) {
      document.getElementById("final").textContent = `${hits} de ${total}`;
      document.getElementById("verdict").textContent = grade(hits);
      result.classList.add("show");
      result.scrollIntoView({ behavior: "smooth" });
    } else {
      result.classList.remove("show");
    }
  }

  // Baremo común: 9-10 / 6-8 / 5 o menos sobre 10 (proporcional con otro número de preguntas)
  function grade(hits) {
    const score = hits / total * 10;
    if (score >= 9) return `Puedes seguir ${CONFIG.nextStep}.`;
    if (score >= 6) return "Repasa las sesiones de las preguntas falladas antes de seguir.";
    return "Vuelve a leer el subbloque antes de seguir. Lo que viene se apoya en estos conceptos.";
  }

  document.getElementById("again").addEventListener("click", () => {
    newDraw();
    render();
    window.scrollTo({ top: 0, behavior: "smooth" });
  });

  newDraw();
  render();
})();
