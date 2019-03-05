module MappingLanguage
  module ActsAsLangMapping
    extend ActiveSupport::Concern
    module ClassMethods
      def acts_as_lang_mapping(*fields, lang)
        has_many :lang_mappings, as: :kclass
        fields.each do |field|
          define_method(field) do
            LangMapping.get_lang_field(self, lang[:language], field)
          end
        end
      end
    end
  end
end
ActiveRecord::Base.send(:include, MappingLanguage::ActsAsLangMapping)
