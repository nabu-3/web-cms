{nabu_model model="bootstrap-3.3.7"}
{nabu_raw_assign}
    table_metadata: [
        toolbar: [
            groups: [
                1: [
                    buttons: [
                        add: [
                            type: "default"
                            icon: "fa fa-plus"
                            apply: "all"
                            modal: "modal_new_repository"
                        ]
                        edit: [
                            type: "default"
                            icon: "fa fa-pencil"
                            apply: "single"
                        ]
                    ]
                ]
                3: [
                    buttons: [
                        delete: [
                            type: "danger"
                            icon: "fa fa-trash"
                            apply: "multiple"
                        ]
                    ]
                ]
            ]
        ]
        fields: [
            id: [
                title: 'ID'
                order: 'number'
                align: 'right'
                id: true
            ]
            key: [
                title: 'Key'
                order: 'alpha'
            ]
            title: [
                title: 'Nombre'
                order: 'alpha'
            ]
        ]
        translations: [
            search_button: "{nabu_static key=btn_search}"
            columns_button: "{nabu_static key=btn_columns}"
            show_all_columns: "{nabu_static key=sel_show_all}"
            hide_all_columns: "{nabu_static key=sel_hide_all}"
        ]
    ]
{/nabu_raw_assign}
<div class="edit-zone">
    {if count($data)>0}
        {include file="content/parts/flag-selector.tpl" lang_list=$nb_languages default_lang=$nb_language.id}
            {nabu_table id=medioteca_list data=$data metadata=$table_metadata selectable=true
                        bordered=true striped=true hover=true condensed=true
                        search=false pager=false size=25 column_selector=true
                        api=api_call editor=item_edit edit_button=line}
    {else}
        {nabu_assign var=info_section section=empty_data}
        {nabu_panel type=info title=$info_section}{$info_section.translation.opening}{/nabu_panel}
    {/if}
</div>