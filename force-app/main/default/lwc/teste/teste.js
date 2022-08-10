import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import NUMERO_CONTA from '@salesforce/schema/Account.AccountNumber';
import NOME_CONTA from '@salesforce/schema/Account.Name';
import TIPO_CONTA from '@salesforce/schema/Account.Type';

const SUCCESS_TITLE = 'Dados Atualizados!';
const SUCCESS_VARIANT = 'success';
const MESSAGE = 'Dados atualizados com sucesso';

export default class Teste extends NavigationMixin(LightningElement) {
    
    numeroConta = NUMERO_CONTA;
    nomeConta = NOME_CONTA;
    tipoConta = TIPO_CONTA;

    
    @api recordId;
    @api objectApiName;

    handleSuccess(event){

        const toastEvent = new ShowToastEvent({
            title: SUCCESS_TITLE,
            message: MESSAGE,
            variant: SUCCESS_VARIANT
        });
        this.dispatchEvent(toastEvent);
    }
}