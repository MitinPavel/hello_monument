module CollectionListHelpers
  def within_collection_area(collection, &block)
    within "#collection_#{collection.id}", &block
  end
end
