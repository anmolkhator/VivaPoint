// Slide-in side menu
(function () {
  var side = document.getElementById('side'), scrim = document.getElementById('scrim'), burger = document.getElementById('burger');
  if (!side) return;
  function open(o) {
    side.classList.toggle('open', o);
    scrim.classList.toggle('on', o);
    burger.setAttribute('aria-expanded', o);
    side.setAttribute('aria-hidden', !o);
  }
  burger.onclick = function () { open(true); };
  scrim.onclick = document.getElementById('sclose').onclick = function () { open(false); };
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') open(false); });
})();

// Light / dark theme toggle (remembered in this browser)
(function () {
  var root = document.documentElement, tg = document.getElementById('tg');
  try { var t = localStorage.getItem('vq_theme'); if (t) root.dataset.theme = t; } catch (e) {}
  if (!tg) return;
  tg.onclick = function () {
    var cur = root.dataset.theme || 'light';
    var next = cur === 'dark' ? 'light' : 'dark';
    root.dataset.theme = next;
    try { localStorage.setItem('vq_theme', next); } catch (e) {}
  };
})();
