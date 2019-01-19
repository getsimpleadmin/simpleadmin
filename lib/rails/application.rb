module Rails
  class Application
    def load_models!
      load_path = 'app/models'

      matcher = /\A#{Regexp.escape(load_path.to_s)}\/(.*)\.rb\Z/

      Dir.glob("#{load_path}/**/*.rb").sort.each do |file|
        require_dependency file.sub(matcher, '\1')
      end
    end
  end
end
