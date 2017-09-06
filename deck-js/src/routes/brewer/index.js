import { h, Component } from 'preact';
import { createApolloFetch } from 'apollo-fetch';
import BeerList from '../../components/beer_list';
import style from './style';

export default class Brewer extends Component {
	state = {
		userName: "",
		beerCount: 0,
		beers: [],
	};

	parseData = (data) => {
		const user = data.user
		this.setState({
			userName: user.name,
			beerCount: user.beers.length,
			beers: user.beers
		});
	}
	
	// gets called when this route is navigated to
	componentDidMount() {
		const uri = 'http://localhost:4000/graph';
		const apolloFetch = createApolloFetch({ uri });

		const query = `
			query userBeers($id: ID!, $onTap: Boolean) {
				user(id: $id){
					name
					id
					uuid
					beers(onTap: $onTap){
						id
						name
						style
						description
						ingredients
						abv
						measuredOriginalGravity
						measuredFinalGravity
						boilTime
						estimatedIbu
						volumeInLiters
						brewDate
						bottleOrKegDate
						rating
						onTap
					}
				}
			}
		`;
		
		const variables = {
			id: this.props.uuid,
			onTap: true,
		};

		apolloFetch({ query, variables })
			.then(result => {
				const { data, errors, extensions } = result;
				this.parseData(data);
			})
			.catch(error => {
				console.log(error)
				//respond to a network error
		});
	}

	// Note: `user` comes from the URL, courtesy of our router
	render({uuid}, {userName, beerCount, beers }) {
		return (
			<div class={style.brewer}>
				<h1>Brewer: {userName}</h1>
				<p>This is the brewer profile for a user named {userName}.</p>
				<div>beers on tap: {beerCount}</div>
				<BeerList beers={beers}/>
			</div>
		);
	}
}
