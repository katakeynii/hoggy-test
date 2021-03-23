import React, { Component } from 'react'
import { connect } from 'react-redux'

export class ClientPage extends Component {
    render() {
        return (
            <div>
                Page Création client
            </div>
        )
    }
}

const mapStateToProps = (state) => ({

});
const mapDispatchToProps = (dispatch) => ({

});

export default connect(mapStateToProps, mapDispatchToProps)(ClientPage)
