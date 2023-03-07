import { LightningElement,track } from 'lwc';
import retrieveNews from '@salesforce/apex/NewsApiCallout.retrieveNews';
export default class NewsRoomLWC extends LightningElement {
    @track result = [];
    @track selectedNews = {};
    @track isModalOpen = false;
    get modalBackdropClass(){
        return this.isModalOpen ? "slds-backdrop slds-backdrop_open":"slds-backdrop"
    }
    get modalClass(){
        return this.isModalOpen ? "slds-modal slds-fade-in-open":"slds-modal"
    }
connectedCallback(){
        this.fetchNews();
    }
fetchNews(){
    retrieveNews().then((response) => {
        console.log(response);
        this.formatNewsData(response.articles);

    })
    .catch((ex) => {
        console.log(ex);

    })
}

formatNewsData(res){
    this.result = res.map((item,index) => {
        let id = `new_${index + 1}`;
        let name = item.source.name;
        let date = new Date(item.publishedAt).toDateString();
        console.log(JSON.stringify({...res,id:id, name:name}));
        return {...item,id:id, name:name,date:date}
    })
}
showModal(event){
    let id = event.target.dataset.item
    this.result.forEach((item) =>{
        if(item.id === id){
            this.selectedNews = {...item}
        }
    })
    this.isModalOpen = true;
}
closeModal(){
    this.isModalOpen = false;
}
}