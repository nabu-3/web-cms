{nabu_model model="bootstrap-3.3.7"}
{nabu_assign var=modal_new section=new_role}
{nabu_assign var=modal_new_success section=new_role_success}
{nabu_assign var=modal_new_error section=new_role_error}
{nabu_assign var=api cta=api_role}
{nabu_assign var=editor cta=item_edit}
{nabu_modal id=modal_new_role size=lg caller=item_list aria_labelledby=modal_new_role_head}
    {nabu_form layout="horizontal:2:10" method="ajax-post" action=$api.translations[$nb_site.api_language_id].final_url|sprintf:"" validation=live evaluate=visible}
        <div class="modal-steps">
            <div class="modal-step" data-step="1">
                {nabu_modal_header dismiss=true aria_label_id=modal_new_role_head}{$modal_new.translation.title}{/nabu_modal_header}
                {nabu_modal_body}
                    <div class="row">
                        <aside class="col-sm-3">{$modal_new.translation.opening}</aside>
                        <section class="col-sm-9 col-sm-offset-3" data-toggle="toggable-lang">
                            {nabu_form_textbox label={nabu_static key=lbl_key} name=key maxlength=64 help={nabu_static key=hlp_edit_role_key} mandatory=true rule=filled}
                            {nabu_form_textbox label={nabu_static key=lbl_name} name=name help={nabu_static key=hlp_edit_role_name} multilang=$nb_languages mandatory=true rule=filled}
                        </section>
                    </div>
                {/nabu_modal_body}
                {nabu_modal_footer}
                    {include file="content/parts/flag-selector.tpl" lang_list=$nb_languages
                             default_lang=$nb_site.default_language_id target="#modal_new_role"}
                    <button type="button" class="btn btn-link" data-dismiss="modal">{nabu_static key=btn_cancel}</button>
                    {nabu_form_command type=submit class="btn btn-success" formfollow=active anchor_text={nabu_static key=btn_create}}
                {/nabu_modal_footer}
            </div>
        </div>
        <div class="modal-panels hide">
            <div class="modal-panel" data-action="success">
                {nabu_modal_header dismiss=true}{$modal_new_success.translation.title}{/nabu_modal_header}
                {nabu_modal_body}{$modal_new_success.translation.opening}{/nabu_modal_body}
                {nabu_modal_footer}
                    <button type="button" class="btn btn-link" data-dismiss="modal">{nabu_static key=btn_close}</button>
                    <a class="btn btn-info"{if is_array($editor) && count($editor)>0} data-toggle="modal-btn-editor" data-editor="{$editor.translation.final_url}"{/if}>{nabu_static key=btn_continue}</a>
                {/nabu_modal_footer}
            </div>
            <div class="modal-panel" data-action="error">
                {nabu_modal_header dismiss=true}{$modal_new_error.translation.title}{/nabu_modal_header}
                {nabu_modal_body}{$modal_new_error.translation.opening}{/nabu_modal_body}
                {nabu_modal_footer}
                    <button type="button" class="btn btn-link" data-dismiss="modal">{nabu_static key=btn_close}</button>
                {/nabu_modal_footer}
            </div>
        </div>
    {/nabu_form}
{/nabu_modal}
