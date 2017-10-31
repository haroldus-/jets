# TODO: move the handler_generator.rb deducing methods into lambda_deducer.rb
# This deducer is used for more than just the node shim generation.
# It is also used by the child_template
class Jets::Build
  class LambdaDeducer
    attr_reader :path, :handlers
    def initialize(path)
      @path = path
    end

    def class_name
      @path.sub(%r{app/(\w+)/},'').sub('.rb','').classify # PostsController
    end

    # Returns: [:create, :update]
    def functions
      require "#{Jets.root}app/controllers/application_controller"

      # Example: require "./app/controllers/posts_controller.rb"
      require_path = @path.starts_with?('/') ? @path : "#{Jets.root}#{@path}"
      require require_path

      class_name
      klass = class_name.constantize
      klass.lambda_functions
    end

    # Returns: "handlers/controllers/posts.js"
    def js_path
      @path.sub("app", "handlers").sub("_controller.rb", ".js")
    end

    # Used to show user where the generated files gets written to.
    # Returns: "/tmp/jets_build/templates/proj-dev-posts-controller.yml"
    def cfn_path
      controller_name = @path.sub(/.*controllers\//, '').sub('.rb','')
                          .underscore.dasherize
      stack_name = "#{Jets::Config.project_namespace}-#{controller_name}"
      "/tmp/jets_build/templates/#{stack_name}.yml"
    end
  end
end