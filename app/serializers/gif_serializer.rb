class GifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :images, :copyright
end
