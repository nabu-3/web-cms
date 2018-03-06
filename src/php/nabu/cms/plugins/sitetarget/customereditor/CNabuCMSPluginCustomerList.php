<?php

/*  Copyright 2009-2011 Rafael Gutierrez Martinez
 *  Copyright 2012-2013 Welma WEB MKT LABS, S.L.
 *  Copyright 2014-2016 Where Ideas Simply Come True, S.L.
 *  Copyright 2017 nabu-3 Group
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

namespace nabu\cms\plugins\sitetarget\customereditor;

use nabu\data\lang\CNabuLanguage;

use nabu\data\customer\CNabuCustomer;

use nabu\http\adapters\CNabuHTTPSiteTargetPluginAdapter;

/**
 * @author Rafael Gutierrez <rgutierrez@nabu-3.com>
 * @since 3.0.2 Surface
 * @version 3.0.2 Surface
 * @package \nabu\cms\plugins\sitetarget\customereditor
 */
class CNabuCMSPluginCustomerList extends CNabuHTTPSiteTargetPluginAdapter
{
    /** @var array $customer_data Array with all available Customers. */
    private $customer_data = null;

    public function prepareTarget()
    {
        $this->customer_data = CNabuCustomer::getAllCustomers();

        return true;
    }

    public function beforeDisplayTarget()
    {
        $render = $this->nb_response->getRender();
        $render->smartyAssign('nb_languages', CNabuLanguage::getNaturalLanguages(), $this->nb_language);
        $render->smartyAssign('data', $this->customer_data, $this->nb_language);

        return true;
    }
}