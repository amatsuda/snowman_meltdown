module SnowmanMeltdown
  class TargetExtractor
    include ActionView::Helpers::FormTagHelper

    def extract
      extra_tags_for_form('method' => 'get').scan(/<input .*? type="hidden" .*?>/).first
    end
  end
end
