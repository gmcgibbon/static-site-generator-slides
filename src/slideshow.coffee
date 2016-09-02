document.addEventListener 'DOMContentLoaded', ->
  Reveal.initialize(
    history: true
    dependencies: [
      { src: 'vendor/reveal.js/plugin/markdown/marked.js' },
      { src: 'vendor/reveal.js/plugin/markdown/markdown.js' },
      {
        src:      'vendor/highlightjs/highlight.pack.js'
        async:    true
        callback: -> hljs.initHighlightingOnLoad()
      }
    ]
  )
