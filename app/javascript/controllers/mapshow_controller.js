// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }

  #addMarkerToMap() {
    new mapboxgl.Marker()
      .setLngLat([this.markerValue.lng, this.markerValue.lat])
      .addTo(this.map)
  }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.markerValue.lng, this.markerValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 8, duration: 0 })
  }
}