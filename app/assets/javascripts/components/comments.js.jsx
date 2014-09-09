/** @jsx React.DOM */
var Comment = React.createClass({
    render: function () {
        return (
            <div className="comment">
                <h4 className="commentAuthor">
          {this.props.author}
                </h4>
          {this.props.comment}
            </div>
        );
    }
});

var CommentList = React.createClass({
    render: function () {
        var commentNodes = this.props.comments.map(function (comment, index) {
            return (
                <Comment author={comment.author} comment={comment.comment} key={index} />
            );
        });

        return (
            <div className="commentList">
        {commentNodes}
            </div>
        );
    }
});

 var CommentBox = React.createClass({
    getInitialState: function () {
        return {comments: []};
    },
    componentDidMount: function () {
        this.loadCommentsFromServer();
    },
    loadCommentsFromServer: function () {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            success: function (comments) {
                this.setState({comments: comments.comments});
            }.bind(this),
            error: function (xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },
    render: function () {
        return (
            <div className="commentBox">
                <CommentList comments={this.state.comments} />
            </div>
        );
    }
});

var ready = function () {
    var comments_url = $(".btn-primary").data('url');
    window.commentBox = React.renderComponent(
        <window.CommentBox url= {comments_url} />,
        document.getElementById('comments')
    );
};

$(document).ready(ready);
$(document).on('page:load', ready);
