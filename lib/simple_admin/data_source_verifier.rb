module SimpleAdmin
  class DataSourceVerifier
    def ensure(model)
      model.respond_to?(:table_exists?) && model.table_exists? && model.name.deconstantize.match(/SimpleAdmin/).nil?
    end

    def to_proc
      method(:ensure).to_proc
    end
  end
end
