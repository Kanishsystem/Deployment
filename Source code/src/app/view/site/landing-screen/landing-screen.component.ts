import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { get_api_full_route, get_api_route } from 'src/app/api-services/api-router';
import { NotifyService } from 'src/app/api-services/common/notify.service';
import { SpinnerService } from 'src/app/api-services/common/spinner.service';
import { SessionStorageServiceService } from 'src/app/api-services/core/session-storage-service.service';
import { SmartapiService } from 'src/app/api-services/smartapi.service';
import { SmartDialogService } from 'src/app/shared/core/services/smart-dialog.service';

@Component({
  selector: 'app-landing-screen',
  templateUrl: './landing-screen.component.html',
  styleUrls: ['./landing-screen.component.css'],
})
export class LandingScreenComponent {
  imageUrl = "";
  constructor(
    private route: Router,
    private spinner: SpinnerService,
    private api: SmartapiService,
    private notify: NotifyService,
    private userSession: SessionStorageServiceService,
    private modalService: NgbModal,
    private smartDialog: SmartDialogService
  ) {
    console.log('login componeent loaded ');
    this.imageUrl = get_api_full_route("HOME_IMAGES_GET_ONE_IMAGE")
  }

  images: string[] = [
    '/assets/images/slide-images/igcar-1.jpg',
    '/assets/images/slide-images/igcar-2.jpg',
    '/assets/images/slide-images/igcar-3.jpg',
    // Add more image URLs as needed
  ];

  currentImageIndex: number = 0;
  //
  currentImageSrc:any;

  siteSettings: any;

  openCLose: boolean = false;
  //
  cardData: any;

  newArray: any;

  number: number;

  array: any = [];
  //
  shutdowndata:any=[];
  //
  mainTab:string="main";

  private slideshowInterval: any;

  ngOnInit(): void {
    this.getHomeImagesData();
    this.getSettingsData();
    this.getActivity();
    this.startSlideshow();
    this.getShutDownData();
    
  }

  getHomeImagesData() {
    this.images = [];
    let id =0;
    this.api.smartGet('HOME_IMAGES_GET_ALL').subscribe((res: any) => {
       res.forEach(element => {      
        let image_url = this.imageUrl + "/" + element.ID;
        this.images.push(element.ID)       
        if(id == 0){
           id = element.ID;
           this.getImageUpdate(element.ID);
        }
        this.getSettingsData();
       });
    });
  }
  
   isPdfModalOpen = false;

  openPdfModal() {
    this.isPdfModalOpen = true;
  }

  closePdfModal() {
    this.isPdfModalOpen = false;
  }
  getImageUpdate(id:number){
     let url = get_api_route("HOME_IMAGES_GET_ONE_IMAGE_NEW") + "/" + id;
     //console.log("url =" , url);
     this.api.smartGet(url).subscribe((res: any) => {
        //console.log("data " , res);
        this.currentImageSrc = "data:image/jpeg;base64,"+res?.content;
     });
   }

  updateTab(tab){
    this.mainTab = tab;
  }

  getShutDownData() {
    this.images = [];
    this.api.smartGet('SITE_DASH_SHUTDOWN').subscribe((res: any) => {

       this.shutdowndata = res;
       console.log(this.shutdowndata)
    });
  }

  startSlideshow(): void {
    this.stopSlideshow();
    this.slideshowInterval =   setInterval(() => {
      this.getNextImage();
      let image_id = parseInt(this.images[this.currentImageIndex]);
      this.getImageUpdate(image_id);
    }, 5000); // Change 3000 to the desired timeout interval in milliseconds (3 seconds in this example)
  }

  // Function to stop the slideshow
stopSlideshow(): void {
  if (this.slideshowInterval) {
    clearInterval(this.slideshowInterval);
  }
}


  getNextImage() {
    this.currentImageIndex = (this.currentImageIndex + 1) % this.images.length;
  }

  getSettingsData() {
    this.api.smartGet('AUTH_SITE_SETTINGS').subscribe((res: any) => {
      this.siteSettings = res;
     // console.log("site settings " , this.siteSettings);
      this.userSession.setSettings(res);
    });
  }

  getActivity() {
    let activity = this.userSession.getActivity();
    if (!activity) {
      this.api.smartGet('ACTIVITY_GET_ALL').subscribe((res: any) => {
        //console.log(res);
       // this.userSession.setActivity(res);
        this.cardData = res;
      });
    } else {
      this.cardData = activity;
    }
  }

  shouldFloatReverse: boolean = false;

  // Function to toggle the float reverse
  // toggleFloatReverse() {
  //   this.shouldFloatReverse = !this.shouldFloatReverse;
  // }
  // }
  isEven(number: number): boolean {
    number = this.cardData;
    return number % 2 === 0;
  }

  ngOnDestroy(): void {
    this.stopSlideshow();
  }
  navigatePrevious(): void {
    if (this.currentImageIndex > 0) {
      this.currentImageIndex--;
    } else {
      this.currentImageIndex = this.images.length - 1;
    }
    this.updateCurrentImage();
  }
  
  // Method to navigate to the next image
  navigateNext(): void {
    if (this.currentImageIndex < this.images.length - 1) {
      this.currentImageIndex++;
    } else {
      this.currentImageIndex = 0;
    }
    this.updateCurrentImage();
  }
  
  updateCurrentImage(): void {
    let image_id = parseInt(this.images[this.currentImageIndex]);
    this.getImageUpdate(image_id);
  }
}
