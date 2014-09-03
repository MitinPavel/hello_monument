module Storage
  ##
  # An interface to "file storage" bounded context.
  #
  class Facade
    include Singleton

    ##
    # Stores a passed file.
    # Return identifier string of the
    # Returns an identifier of the stored file.
    #
    def store_file(file)
      ::Storage::Picture.create!(asset: file).id.to_s
    end

    def thumbnail_url(file_id)
      ::Storage::Picture.find(Integer(file_id)).asset.url
    end
  end
end
