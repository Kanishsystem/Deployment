import { Component, ElementRef, HostListener, Input } from '@angular/core';

import 'pdfjs-dist/build/pdf';

declare var pdfjsLib: any;

@Component({
  selector: 'app-smart-pdf-view',
  templateUrl: './smart-pdf-view.component.html',
  styleUrls: ['./smart-pdf-view.component.css']
})
export class SmartPdfViewComponent {

  @Input('data') data: any;

  private pdf: any;
  private container: HTMLElement;
  private scale: number = 1;
  private currentPage: number = 0;
  private intervalId: any;

  constructor(private elementRef: ElementRef) { }
  // get unit array from base 64 binary
  getUnitArray() {
    const base64Data = this.data;
    //console.log("testing " );
    //console.log("base64Data " , base64Data);
    const binaryData = atob(base64Data);
    const uint8Array = new Uint8Array(binaryData.length);

    for (let i = 0; i < binaryData.length; i++) {
      uint8Array[i] = binaryData.charCodeAt(i);
    }
    // console.log("completed conversion" );
    return uint8Array;
  }

  add_page_div(i:number){
    const divHtml = document.createElement('div');
    divHtml.id = "smart-pdf-page-"+i;
    this.container.appendChild(divHtml);
  }


  renderPage(pageNumber: number): void {
    const canvas = document.createElement('canvas');
    canvas.classList.add('pdf-canvas');
    this.container.appendChild(canvas);
    this.pdf.getPage(pageNumber).then((page: any) => {
      const viewport = page.getViewport({ scale: this.scale });
      const context = canvas.getContext('2d');
      canvas.height = viewport.height;
      canvas.width = viewport.width;
      page.render({ canvasContext: context, viewport });
    });
  }

  
  renderPageNew(pageNumber: number): void {
   let pagecontainer = document.getElementById("smart-pdf-page-"+pageNumber);
    const canvas = document.createElement('canvas');
    canvas.classList.add('pdf-canvas');
    pagecontainer.appendChild(canvas);
    this.pdf.getPage(pageNumber).then((page: any) => {
      const viewport = page.getViewport({ scale: this.scale });
      const context = canvas.getContext('2d');
      canvas.height = viewport.height;
      canvas.width = viewport.width;
      page.render({ canvasContext: context, viewport });
    });
  }

  @HostListener('document:scroll', ['$event'])
  onScroll(event: any): void {
    console.log("scrool event is added ")
    const element = this.elementRef.nativeElement.querySelector('.pdf-container');
    /*
    //const element = this.elementRef.nativeElement;
    const offset = this.container.offsetHeight / 2; // Load next page when scrolling halfway through the element
    console.log("reseting " , offset);
    if (this.container .scrollTop + this.container .clientHeight >= this.currentPageHeight - offset) {
    //  this.loadNextPage();
    }*/
  }

  renderAllPages() {
    this.container.innerHTML = "";
    const numPages = this.pdf.numPages;
    for(let i=1; i<=numPages;i++){
       this.add_page_div(i);
    }
  //  for(let i=2; i<=10;i++){
      this.renderPageNew(1);
  //  }
    this.currentPage = 2;
    this.intervalId = setInterval(() => {
      this.currentPage ++;
      this.renderPageNew( this.currentPage);
      if (this.currentPage === numPages) {
        // All pages loaded, clear the interval
        clearInterval(this.intervalId);
      }
    }, 1000);
    /*
    this.renderPage(1);
    setTimeout(() => {
      this.renderPage(2);
    }, 1000);
    
    //console.log("number of pages " , numPages);
    for(let i=1; i<=numPages;i++){
       //console.log("render pahe " , i);
        this.renderPage(i);
    }*/

  }


  ngAfterViewInit() {
    this.container = this.elementRef.nativeElement.querySelector('#pdfViewer');
    //const pdfPath = 'http://localhost:4200/assets/test.pdf';    
    pdfjsLib.getDocument({ data: this.getUnitArray() }).promise.then((pdf: any) => {
      this.pdf = pdf;
      this.renderAllPages();
    });
  }

  zoomIn() {
    this.scale = this.scale + 0.1;
    if (this.scale > 4) {
      this.scale = 4;
    }
    this.renderAllPages();
  }
  zoomOut() {
    this.scale = this.scale - 0.1;
    if (this.scale < 0.5) {
      this.scale = 0.5;
    }
    this.renderAllPages();
  }

}
