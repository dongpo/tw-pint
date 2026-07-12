(function () {
  'use strict';

  var circled = ['','①','②','③','④','⑤','⑥','⑦','⑧','⑨','⑩','⑪','⑫','⑬','⑭','⑮','⑯','⑰','⑱','⑲','⑳'];

  function escapeHtml(value) {
    return value.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  function highlightXml(source) {
    var tokens = [];
    var protectedSource = source.replace(/<!\[CDATA\[[\s\S]*?\]\]>/g, function (match) {
      tokens.push('<span class="xml-cdata">' + escapeHtml(match) + '</span>');
      return '\u0000' + (tokens.length - 1) + '\u0000';
    }).replace(/<!--[\s\S]*?-->/g, function (match) {
      tokens.push('<span class="xml-comment">' + escapeHtml(match) + '</span>');
      return '\u0000' + (tokens.length - 1) + '\u0000';
    });

    var html = '';
    var cursor = 0;
    var tagPattern = /<\/?[A-Za-z_][^>]*>|<\?[^>]*\?>|<!DOCTYPE[^>]*>/g;
    var match;
    while ((match = tagPattern.exec(protectedSource)) !== null) {
      html += escapeHtml(protectedSource.slice(cursor, match.index));
      var rawTag = match[0];
      var tagHtml = escapeHtml(rawTag).replace(/([A-Za-z_:][\w:.-]*)(=)(&quot;[^&]*?&quot;|'[^']*?')/g,
        '<span class="xml-attr-name">$1</span>$2<span class="xml-attr-value">$3</span>');
      html += '<span class="xml-tag">' + tagHtml + '</span>';
      cursor = match.index + rawTag.length;
    }
    html += escapeHtml(protectedSource.slice(cursor));

    return html.replace(/\u0000(\d+)\u0000/g, function (_, index) {
      return tokens[Number(index)];
    });
  }

  function markExampleTitles() {
    document.querySelectorAll('#content p, #content .paragraph').forEach(function (node) {
      var text = (node.textContent || '').trim();
      if (/^UBL example\b/i.test(text)) node.classList.add('ubl-example-title');
    });
  }

  function formatXmlBlocks() {
    document.querySelectorAll('#content .listingblock pre, #content .literalblock pre').forEach(function (pre) {
      var code = pre.querySelector('code');
      var target = code || pre;
      var source = target.textContent || '';
      var language = (target.getAttribute('data-lang') || target.className || '').toLowerCase();
      if (language.indexOf('xml') === -1 && !/^\s*(<\?xml\b|<[A-Za-z_][\w:.-]*(?:\s|>|\/))/m.test(source)) return;

      pre.classList.add('xml-example');
      var block = pre.closest('.listingblock, .literalblock');
      if (block) block.classList.add('xml-example');
      target.innerHTML = highlightXml(source);
    });
  }

  function formatCallouts() {
    document.querySelectorAll('#content .conum[data-value]').forEach(function (node) {
      var number = Number(node.getAttribute('data-value'));
      if (number > 0 && number < circled.length) {
        node.textContent = circled[number];
        node.classList.add('tw-circled-callout');

        // Asciidoctor emits a fallback such as <b>(1)</b> after the conum.
        // Remove it before XML highlighting reads textContent.
        var fallback = node.nextElementSibling;
        if (fallback && fallback.tagName === 'B') fallback.remove();
      }
    });
  }

  document.addEventListener('DOMContentLoaded', function () {
    markExampleTitles();

    // Callouts must be converted before formatXmlBlocks() replaces the
    // original listing markup with syntax-highlighted HTML.
    formatCallouts();
    formatXmlBlocks();
  });
}());
