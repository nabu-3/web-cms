{nabu_model model="bootstrap-3.3.7"}
{nabu_modal id=ve_edit_site_target_safety_policy size=lg caller=site_edit_targets aria_labelledby=ve_edit_site_target_safety_policy_head}
    {nabu_assign var=api cta=api_site_target}
    {if array_key_exists($nb_site.api_language_id, $api.translations)}
        {nabu_form layout=vertical method="ajax-post" action=$api.translations[$nb_site.api_language_id].final_url|sprintf:$edit_site.id:$edit_site_target.id}
            {nabu_modal_header dismiss=true aria_label_id=ve_edit_site_target_safety_policy_head}{$nb_site_target.translation.title|sprintf:$edit_site_target.translations[$edit_site.default_language_id].title}{/nabu_modal_header}
            {nabu_modal_body}
                <div class="row">
                    <aside class="col-sm-3">{$nb_site_target.translation.opening}</aside>
                    <section class="col-sm-9 col-sm-offset-3" data-toggle="toggable-lang">
                        {nabu_raw_assign}
                            sel_options: [
                                FILE: "Fichero"
                                IMAGE: "Imagen"
                                JSON: "JSON"
                                HTML: "Smarty"
                            ]
                        {/nabu_raw_assign}
                        {nabu_form_row}
                            {nabu_form_textbox class="col-sm-4" label={nabu_static key=lbl_publication_date} from=$edit_site_target field=begin_date}
                        {/nabu_form_row}
                        {nabu_form_row}
                            {nabu_form_textbox id=memetype_id class="col-sm-6" label={nabu_static key=lbl_mime_type} from=$edit_site_target field=mimetype_id datalist=$used_mimetypes}
                            <div class="col-sm-6 container-checkbox">{nabu_form_checkbox label={nabu_static key=chk_download_as_attachment} from=$edit_site_target field=attachment check=T uncheck=F}</div>
                        {/nabu_form_row}
                        {nabu_form_row}
                            {nabu_form_select class="col-sm-6" label={nabu_static key=lbl_render_output} from=$edit_site_target field=output_type options=$sel_options}
                        {/nabu_form_row}
                        {nabu_form_row}
                            {nabu_form_select class="col-sm-6" label={nabu_static key=lbl_render}
                                              from=$edit_site_target field=render_interface
                                              options=$render_interfaces options_name=interface_name
                                              options_default_id='' options_default_name={nabu_static key=sel_default_render}}
                            {nabu_form_select class="col-sm-6" label={nabu_static key=lbl_render_transform}
                                              from=$edit_site_target field=transform_interface
                                              options=$transform_interfaces options_name=interface_name
                                              options_default_id='' options_default_name={nabu_static key=sel_default_render_transform}}
                        {/nabu_form_row}
                        {*<div class="col-sm-6 container-checkbox">{nabu_form_checkbox label={nabu_static key=chk_ignore_site_policies} from=$edit_site_target field=ignore_policies check=T uncheck=F}</div>*}
                    </section>
                </div>
            {/nabu_modal_body}
            {nabu_modal_footer}
                <button type="button" class="btn btn-link" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-success">Guardar</button>
            {/nabu_modal_footer}
        {/nabu_form}
    {/if}
{/nabu_modal}
