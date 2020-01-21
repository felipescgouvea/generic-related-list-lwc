import { LightningElement, api, wire, track } from 'lwc';
import callCorrectMethod from '@salesforce/apex/GenericTableController.dispatchMethod';
export default class GenericTable extends LightningElement {

    @api classToUse;
    @api recordId;
    @api title;
    @api iconName;
    @api columns;
    @track className;
    @track data;
    @track listSize;
    @track columnsFormatted;
    connectedCallback(){
        console.log('recordId', this.recordId);
        console.log('columns', this.columns);
        this.className = this.classToUse;
        this.columnsFormatted = JSON.parse(this.columns);
        //this.columns = [{ label: "Nome", fieldName: 'Name', type: 'text'}, { label: "Email", fieldName: 'Email', type: 'email'}, { label: "Data de nascimento", fieldName: 'Birthdate', type: 'text'}];
        //this.iconName = 'action:approval';
        //this.title = 'Contacts';
        this.size = 0;
    }


    @wire(callCorrectMethod, {className : '$className', recordId : '$recordId'})
    wiredContacts({ error, data }) {
        if (data) {
            this.data = data;
            console.log('this data: ', JSON.stringify(this.data));
            this.listSize = data.length;
            this.error = undefined;
        } else if (error) {
            console.log('error', JSON.stringify(error));
            this.error = error;
            
            this.data = undefined;
        }
    }

    handleChange(event){
        this.recordId = event.target.value;
        console.log("foi!");
    }
}