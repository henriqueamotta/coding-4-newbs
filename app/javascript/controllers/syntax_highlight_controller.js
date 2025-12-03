import { Controller } from "@hotwired/stimulus"
import hljs from "highlight.js"

export default class extends Controller {
  connect() {
    console.log("🎨 Syntax Highlight Controller conectado!");

    // 1. Aplica o highlight em todos os blocos <pre><code>
    hljs.highlightAll();

    // 2. Adiciona o botão de copiar
    this.addCopyButtons();
  }

  addCopyButtons() {
    // Seleciona todos os blocos de código
    document.querySelectorAll('pre').forEach((preBlock) => {
      // Se já tiver botão, não adiciona de novo (evita duplicação no Turbo)
      if (preBlock.querySelector('.copy-btn')) return;

      // Cria o contêiner para posicionamento relativo
      preBlock.style.position = 'relative';

      // Cria o botão
      const button = document.createElement('button');
      button.className = 'copy-btn btn btn-sm btn-dark';
      button.style.position = 'absolute';
      button.style.top = '5px';
      button.style.right = '5px';
      button.style.zIndex = '10';
      button.style.opacity = '0.7';
      button.innerHTML = '<i class="fa-solid fa-copy"></i>'; // Requer FontAwesome

      // Adiciona ação de clique
      button.addEventListener('click', () => {
        const code = preBlock.querySelector('code').innerText;
        navigator.clipboard.writeText(code).then(() => {
          // Feedback visual
          button.innerHTML = '<i class="fa-solid fa-check"></i>';
          button.classList.replace('btn-dark', 'btn-success');

          setTimeout(() => {
            button.innerHTML = '<i class="fa-solid fa-copy"></i>';
            button.classList.replace('btn-success', 'btn-dark');
          }, 2000);
        });
      });

      preBlock.appendChild(button);
    });
  }
}
