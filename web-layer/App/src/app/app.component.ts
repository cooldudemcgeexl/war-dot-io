import { Component, OnDestroy, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { interval } from 'rxjs';
import { takeWhile } from 'rxjs/operators';


@Component({
	selector: 'app-root',
	templateUrl: './app.component.html',
	styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
	public done: boolean = false;
	public graph: string = "assets/flowdiagram.png";
	public image: string = "assets/flowdiagram.png";
	public outcome: string = "";
	private url: string = "http://127.0.0.1:8000/";

	constructor(private http: HttpClient) { }

	ngOnInit(): void {
		this.reloadData();
		let interval = setInterval(() => {
			this.reloadData();
		}, 300000)
	}

	private reloadData() {
		this.http.get<string>(this.url + "/reload").subscribe(x => {
			this.outcome = x; //needs to be changed slightly so the images regenerate
			this.image = this.image;
			this.graph = this.graph;
		})
	}
}
