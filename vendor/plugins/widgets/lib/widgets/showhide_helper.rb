module Widgets
  module ShowhideHelper

    def show_detail_for record, link_name = 'show details'
      link_to_function link_name, nil, :id => show_link_id(record) do |page| 
        page[detail_id(record)].show
        page[show_link_id(record)].hide
      end 
    end
 
    def hide_detail_for record, link_name = 'hide details'
      link_to_function link_name, nil, :id => hide_link_id(record) do |page| 
        page[detail_id(record)].hide
        page[show_link_id(record)].show
      end 
    end
  
    # Crea un div di dettagli per un record 
    def detail_for record, &block
      concat(render_default_css, block.binding) unless @_showhide_css_done 
      div_for(record, 'detail_for', :style => 'display: none;', :class => 'detail', &block)
      @_showhide_css_done = true # prevents to print the CSS multiple times
      nil
    end

    private
  
    def detail_id record
      dom_id(record, 'detail_for')
    end

    def show_link_id record
      dom_id(record, 'show_detail_for')
    end

    def hide_link_id record
      dom_id(record, 'hide_detail_for')
    end

    def render_default_css
      <<-END
      <style>
       .detail{border:1px solid #5cb5dd;background:#fff;padding:5px;margin-top:0 !important;margin:3px 0;}
       .detail a{color:#39f;text-decoration:none;}
       .detail a:hover{color:#369;text-decoration:none;}
      </style>
      END
    end
  end
end
