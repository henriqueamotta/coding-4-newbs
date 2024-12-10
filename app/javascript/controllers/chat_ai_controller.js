import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "questions"]
  connect() {
    this.scrollToBottom();
  }

  scrollToBottom() {
    if (this.hasQuestionsTarget) {
       this.questionsTarget.scrollTo({
        top: this.questionsTarget.scrollHeight,
        behavior: "smooth"
      });
    } else {
      console.error("Não funcionou!");
    }
  }

  reset() {
    this.element.reset();
  }

  submitOnEnter(event){
    if (event.key === "Enter" && !event.shiftKey) {
       event.preventDefault();
       this.element.requestSubmit();
    }
  }
}
