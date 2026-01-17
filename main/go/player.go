components {
  id: "player"
  component: "/main/scripts/player.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"tile_0380\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/atlas/character.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "bomb_factory"
  type: "factory"
  data: "prototype: \"/main/go/bomb.go\"\n"
  ""
}
