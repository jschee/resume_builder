import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="to-top"
export default class extends Controller {
  connect() {
  }

  bringToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
}
