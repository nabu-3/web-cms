{nabu_model model="bootstrap-3.3.7"}
{nabu_modal id=ve_edit_site_target_identity size=lg caller=site_edit_targets aria_labelledby=ve_edit_site_target_identity_head}
    {nabu_assign var=api cta=api_site_target}
    {if array_key_exists($nb_site.api_language_id, $api.translations)}
        {nabu_form layout=vertical method="ajax-post" action=$api.translations[$nb_site.api_language_id].final_url|sprintf:$edit_site.id:$edit_site_target.id}
            {nabu_modal_header dismiss=true aria_label_id=ve_edit_site_target_identity_head}{$nb_site_target.translation.title|sprintf:$edit_site_target.translations[$edit_site.default_language_id].title}{/nabu_modal_header}
            {nabu_modal_body}
                <div class="row">
                    <aside class="col-sm-3">{$nb_site_target.translation.opening}</aside>
                    <section class="col-sm-9 col-sm-offset-3" data-toggle="toggable-lang">
                        <div class="row">
                            <div class="col-sm-8">
                                {nabu_form_textbox label={nabu_static key=lbl_key} from=$edit_site_target field=key help={nabu_static key=hlp_key} maxlength=30}
                            </div>
                            <div class="col-sm-8">
                                {nabu_form_textbox label={nabu_static key=lbl_GUID} from=$edit_site_target field=hash help={nabu_static key=hlp_GUID} maxlength=38}
                            </div>
                        </div>
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
