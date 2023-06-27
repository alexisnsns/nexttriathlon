import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v11"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }

  #addMarkerToMap() {
    // const customMarker = document.createElement("div");

    // let html = `<img src='https://res.cloudinary.com/dg7xujo5u/image/upload/v1687188037/development/wch5pqh8duytrei4ycidsydkjbpm.png' alt='Logo'>`;
    // customMarker.innerHTML = html;

    // pass customMarker as argument
    new mapboxgl.Marker()
      .setLngLat([this.markerValue.lng, this.markerValue.lat])
      .addTo(this.map)
  }











  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.markerValue.lng, this.markerValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 6, duration: 0 })
  }
}
