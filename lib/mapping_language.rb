module MappingLanguage
  module ActsAsLangMapping
    extend ActiveSupport::Concern
    included do
      has_many :lang_mappings, as: :kclass
    end

    module ClassMethods
      def acts_as_lang_mapping(*fields)
        fields.each do |field|
          define_method(field) do
            LangMapping.get_lang_field(self, field)
          end
        end
      end
    end
  end
end
ActiveRecord::Base.send :include, MappingLanguage::ActsAsLangMapping
