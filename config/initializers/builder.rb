module Builder
  class XmlBase
    unless ::String.method_defined?(:encode)
      def _escape(text)
        text.to_xs
      end
    end
  end
end