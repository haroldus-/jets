require "rack/mime"
require "mimemagic"

class Jets::PublicController < Jets::Controller::Base
  layout false
  internal true

  if Jets::Commands::Build.poly_only?
    # Use python if poly only so we don't have to upload rubuy
    python :show
  else
    def show
      catchall = params[:catchall].blank? ? 'index.html' : params[:catchall]
      public_path = Jets.root + "public"
      catchall_path = "#{public_path}/#{catchall}"

      if File.exist?(catchall_path)
        content_type = Rack::Mime.mime_type(File.extname(catchall_path))
        binary = !MimeMagic.by_path(catchall_path).text?

        # For binary support to work, the client also has to send the right Accept header.
        # And the media type has been to added to api gateway.
        # Cavaet: adding * to as the media type breaks regular form submission.
        # All form submission gets treated as binary.
        if binary
          encoded_content = Base64.encode64(IO.read(catchall_path))
          render plain: encoded_content, content_type: content_type, base64: true
        else
          render file: catchall_path, content_type: content_type
        end
      else
        render file: "#{public_path}/404", status: 404
      end
    end
  end
end
