module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def javascript_pack_tag(filename)
        # FIXME: .first とかガバガバだがしょうがない……
        manifest = JSON.parse(File.read('apps/web/frontend/dist/manifest.json'))
        filename = manifest[manifest.keys.select{|key| key.match? filename }.first]
        javascript filename
      end
    end
  end
end
