<script>
export let width = 0 // Pixel value
export let height = 0 // Pixel value
export let translateZ = 0
export let rotateY = "0deg"
</script>

<div
        class="absolute bg-muted  border-2 h-full w-full"
        style={`width: ${width}px; height: ${height}px; transform: rotateY(${rotateY}) translateZ(${translateZ}px);`}
>
  <div class="relative w-full h-full overflow-y-scroll">
    <slot />
  </div>
</div>