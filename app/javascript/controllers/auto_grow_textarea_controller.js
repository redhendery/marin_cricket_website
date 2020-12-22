import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['input']
  connect() {
    this.inputTarget.style.overflow = 'hidden'
    this.inputTarget.style.minHeight = `${this.inputTarget.scrollHeight}px`
  }

  resize(event) {
    event.target.style.height = `${event.target.scrollHeight}px`
  }
}
