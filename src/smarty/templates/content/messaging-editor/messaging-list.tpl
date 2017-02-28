{nabu_model model="bootstrap-3.3.7"}
{nabu_raw_assign}
    table_metadata: [
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
    ]
{/nabu_raw_assign}
<div class="edit-zone">
    {if count($data)>0}
        {nabu_table data=$data metadata=$table_metadata selectable=true
                    bordered=true striped=true hover=true condensed=true
                    search=false pager=false size=25 column_selector=true
                    api=api_call editor=item_edit edit_button=line}
    {else}
        {nabu_assign var=info_section section=empty_data}
        {nabu_panel type=info title=$info_section}{$info_section.translation.opening}{/nabu_panel}
    {/if}
    <div class="btn-toolbar" role="toolbar" aria-label="Table actions">
        <div class="btn-group pull-right" role="group">
            {nabu_open_modal type=success target=myModal anchor_text="<i class=\"fa fa-plus\"></i>&nbsp;{nabu_static key=btn_new_repository}"}
        </div>
    </div>
</div>
{nabu_assign var=modal_new section=new_repository}
{nabu_assign var=api cta=new_repository}
<!--{$api|print_r:true}-->
{nabu_modal id=myModal size=lg}
    {nabu_form layout="horizontal:2:10" method="ajax-post" action=$api.translations[$nb_site.api_language_id].final_url|sprintf:""}
        {nabu_modal_header dismiss=true}{$modal_new.translation.title}{/nabu_modal_header}
        {nabu_modal_body}
            <div class="row">
                <aside class="col-sm-3">{$modal_new.translation.opening}</aside>
                <section class="col-sm-9 col-sm-offset-3">
                    {nabu_form_textbox label=Key name=key maxlength=30 help="Establece una <b>key</b> para usar tu repositorio desde el código."}
                    {nabu_form_textbox label=Nombre name=name index=$nb_language.id maxlength=100 help="Pon un nombre a tu repositorio para identificarlo en todo momento."}
                </section>
            </div>
        {/nabu_modal_body}
        {nabu_modal_footer}
            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success">Save changes</button>
        {/nabu_modal_footer}
    {/nabu_form}
{/nabu_modal}