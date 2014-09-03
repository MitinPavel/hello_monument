module CollectionListHelpers
  def within_collection_area(collection, &block)
    within "#collection_#{collection.id}", &block
  end

  def within_monument_area(monument, &block)
    within "#monument_#{monument.id}", &block
  end
end
