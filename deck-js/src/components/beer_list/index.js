import { h, Component } from 'preact';


export default class BeerList extends Component {
  render() {
    const beers = this.props.beers;
    const liStyle = { padding: '0.25em' };
    const ulStyle = { listStyle: 'none' };
    const beerStyle = {
      padding: '1em',
      margin: '1em',
      background: 'rgba(250,250,250,0.5)',
      boxShadow: '0 1px 5px rgba(0,0,0,0.5)',
    };

    return (
      <div>
        {beers.map(beer => (
          <Beer beer={beer} beerStyle={beerStyle} listStyle={liStyle} ulStyle={ulStyle}/>
        ))}
      </div>
    );
  }
}

const Beer = ({ beer, beerStyle, liStyle, ulStyle}) => (
  <div style={beerStyle}>
    <h3 style={{padding: '0.125em 2em'}}>{beer.name}</h3>
    <ul style={ulStyle}>
      <li style={liStyle}> Style: {beer.style} </li>
      <li style={liStyle}> Abv: {beer.abv} </li>
      <li style={liStyle}> IBU: {beer.estimatedIbu} </li>
      <li style={liStyle}> OG: {beer.measuredOriginalGravity} </li>
    </ul>
  </div>
);
