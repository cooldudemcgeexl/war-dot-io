import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
	public done: boolean = false;
	public graph: string = "";
	public image: string = "";
	public outcome: string = "";
	private url: string = "http://127.0.0.1:8000/";

	constructor(private http: HttpClient) { }

	ngOnInit(): void {
		this.getImage();
		this.getGraph();
		this.getPrediction();
	}

	private getImage() {
		this.http.get<string>(this.url + "/image").subscribe(x => {
			this.image = 'data:image/png;base64,' + x
			this.done = true
		})
	}

	private getGraph() {
		this.http.get<string>(this.url + "/graph").subscribe(x => this.graph = x)
	}

	private getPrediction() {
		this.http.get<string>(this.url + "/prediction").subscribe(x => this.outcome = x)
	}

}
