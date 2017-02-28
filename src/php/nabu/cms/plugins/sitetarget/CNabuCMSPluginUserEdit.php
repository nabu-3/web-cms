<?php

/*  Copyright 2009-2011 Rafael Gutierrez Martinez
 *  Copyright 2012-2013 Welma WEB MKT LABS, S.L.
 *  Copyright 2014-2016 Where Ideas Simply Come True, S.L.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

namespace nabu\cms\plugins\sitetarget;
use nabu\http\CNabuHTTPRequest;
use nabu\http\adapters\CNabuHTTPSiteTargetPluginAdapter;

/**
 * @author Rafael Gutierrez <rgutierrez@wiscot.com>
 * @version 3.0.0 Surface
 * @package \nabu\cms\plugins\sitetarget
 */
class CNabuCMSPluginUserEdit extends CNabuHTTPSiteTargetPluginAdapter
{
    private $edit_user = null;
    public function prepareTarget()
    {
        $this->edit_user = $this->nb_user;

        return true;
    }

    public function commandUpdate()
    {
        if ($this->nb_request->getMethod() === CNabuHTTPRequest::METHOD_POST) {
            $this->nb_request->updateObjectFromPost(
                $this->edit_user,
                array(
                    'first_name' => 'nb_user_first_name',
                    'last_name' => 'nb_user_last_name'
                )
            );
            $this->edit_user->save();
        }

        return true;
    }

    public function beforeDisplayTarget()
    {
        return true;
    }
}