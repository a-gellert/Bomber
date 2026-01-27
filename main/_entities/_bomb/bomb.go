components {
  id: "bomb"
  component: "/main/_entities/_bomb/bomb.script"
}
components {
  id: "pushable"
  component: "/main/_scripts/pushable.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"tile_0022\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/atlas/character.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"bomb\"\n"
  "mask: \"explosion\"\n"
  "mask: \"player\"\n"
  "mask: \"enemy\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "  }\n"
  "  data: 8.0\n"
  "  data: 8.0\n"
  "  data: 8.0\n"
  "}\n"
  ""
}
embedded_components {
  id: "explosion_factory"
  type: "factory"
  data: "prototype: \"/main/_entities/_explosion/explosion.go\"\n"
  ""
}
