(function () {
  'use strict';
  var content = document.getElementById('content');
  var target = document.getElementById('toc-content');
  if (!content || !target) return;
  var headings = Array.prototype.slice.call(content.querySelectorAll('h1.sect0, .sect1 > h2, .sect2 > h3, .sect3 > h4, .sect4 > h5'));
  if (!headings.length) {
    headings = Array.prototype.slice.call(content.querySelectorAll('h1[id],h2[id],h3[id],h4[id],h5[id]'));
  }
  var root = document.createElement('ul');
  root.className = 'sectlevel0';
  var stack = [{ level: 0, list: root }];
  headings.forEach(function (h) {
    var level = h.matches('h1') ? 0 : Math.max(1, parseInt(h.tagName.substring(1), 10) - 1);
    if (!h.id) h.id = h.textContent.trim().toLowerCase().replace(/[^a-z0-9\u4e00-\u9fff]+/g, '-').replace(/^-|-$/g, '');
    while (stack.length && stack[stack.length - 1].level > level) stack.pop();
    while (stack[stack.length - 1].level < level) {
      var lastLi = stack[stack.length - 1].list.lastElementChild;
      if (!lastLi) break;
      var sub = document.createElement('ul');
      sub.className = 'sectlevel' + level;
      lastLi.appendChild(sub);
      stack.push({ level: stack[stack.length - 1].level + 1, list: sub });
    }
    var li = document.createElement('li');
    var a = document.createElement('a');
    a.href = '#' + h.id;
    a.textContent = h.textContent.trim();
    li.appendChild(a);
    stack[stack.length - 1].list.appendChild(li);
  });
  target.appendChild(root);
})();
