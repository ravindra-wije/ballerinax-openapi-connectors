// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# A paginated list of issue comments
public type PaginatedIssueComments record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, 
    # as it can be expensive to compute
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. 
    # Individual APIs may enforce different values
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to 
    # navigate the result set and refrain from constructing your own URLs
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional element 
    # that is not provided in all responses. Some result sets strictly support forward navigation and never provide 
    # previous links. Clients must anticipate that backwards navigation is not always available. Use this link to 
    # navigate the result set and refrain from constructing your own URLs
    string previous?;
    # An array of issue comment objects returned by the operation
    IssueComment[] values?;
};

# An account object.
public type Account record {
    # links to a resource related to comment object.
    Links links?;
    # Username of the account
    string username?;
    # Account name defined by the owner. Should be used instead of the "username" field. Note that "nickname" cannot be 
    # used in place of "username" in URLs and queries, as "nickname" is not guaranteed to be unique.
    string nickname?;
    # The status of the account. Currently the only possible value is "active", but more values may be added in the 
    # future
    string account_status?;
    # Display name of the account
    string display_name?;
    # Website of the account
    string website?;
    # The created date of the account
    string created_on?;
    # The UUID of the account
    string uuid?;
    # Indicates whether two factor authentication is on
    boolean has_2fa_enabled?;
};

public type Description record {
    # The text as it was typed by a user
    string raw?;
    # The type of markup language the raw content is to be interpreted in.
    string markup?;
    # The user's content rendered as HTML
    string html?;
};

# A user object
public type User record {
    *Account;
    # Indicates whether the user represents staff
    boolean is_staff?;
    # The user's Atlassian account ID
    string account_id?;
};

# An issue.
public type Issue record {
    # links to a resource related to comment object.
    Links links?;
    # The ID of the issue
    int id?;
    # The repository of the issue
    Repository repository?;
    # The title of the issue
    string title?;
    # The reporter of the issue
    User reporter?;
    # To whom this issue was assigned
    User? assignee?;
    # The created date/time of the issue
    string created_on?;
    # The last updated date/time of the issue
    string? updated_on?;
    # The last edited date/time of the issue
    string? edited_on?;
    # The state of the issue
    string state?;
    # The kind of the issue
    string kind?;
    # The priority level of the issue
    string priority?;
    # The milestone of the issue
    Milestone? milestone?;
    # The version of the issue
    Version? 'version?;
    # The component of the issue
    Component? component?;
    # The number of votes
    int votes?;
    # The content of the issue
    Content content?;
};

# A pull request detail
public type PullrequestEndpoint record {
    # Repository detail
    Repository repository?;
    # The branch of the pull request
    PullrequestBranch branch?;
    # The commit hash value  of the pull request
    PullrequestCommit 'commit?;
};

public type Reason record {
    # The text as it was typed by a user
    string raw?;
    # The type of markup language the raw content is to be interpreted in.
    string markup?;
    # The user's content rendered as HTML
    string html?;
};

# User provided pull request text, interpreted in a markup language and rendered in HTML
public type Rendered record {
    # The title of the pull request
    Title title?;
    # The description of the pull request
    Description description?;
    # The reason of the pull request
    Reason reason?;
};

# The error detail
public type ErrorDetail record {
    # The error message
    string message;
    # The error detail
    string detail?;
};

# Pull Request commit hash value
public type PullrequestCommit record {
    # The hash value of the commit
    string hash?;
};

# A version as defined in a repository's issue tracker
public type Version record {
    # links to a resource related to comment object.
    Links links?;
    # The name of the version
    string name?;
    # The ID of the version
    int id?;
};

# A branch object, representing a branch in a repository
public type Branch record {
    *Ref;
    # Available merge strategies for pull requests targeting this branch.
    string[] merge_strategies?;
    # The default merge strategy for pull requests targeting this branch.
    string default_merge_strategy?;
};

# A team object.
#
public type Team record {
    *Account;
};

# A component as defined in a repository's issue tracker
public type Component record {
    # links to a resource related to comment object.
    Links links?;
    # The name of the component
    string name?;
    # The ID of the component
    int id?;
};

# A paginated list of repositories.
public type PaginatedRepositories record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, as it 
    # can be expensive to compute.
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses.
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. 
    # Individual APIs may enforce different values.
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to 
    # navigate the result set and refrain from constructing your own URLs.
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional element 
    # that is not provided in all responses. Some result sets strictly support forward navigation and never provide 
    # previous links. Clients must anticipate that backwards navigation is not always available. Use this link to 
    # navigate the result set and refrain from constructing your own URLs.
    string previous?;
    # An array of repositories
    Repository[] values?;
};

# An array of clones links
#  
public type Clone Link[];

# The pull request commit
public type MergeCommit record {
    # The hash value of the commit
    string hash?;
};

# The base type for all comments. This type should be considered abstract. Each of the "commentable" resources defines 
# its own subtypes (e.g. `issue_comment`).
public type Comment record {
    # The ID of the comment
    int id?;
    # The created date of the comment
    string created_on?;
    # The updated date of the comment
    string? updated_on?;
    # The content of the issue
    Content content?;
    # The user information
    User user?;
    # Indicates whether the comment is deleted
    boolean deleted?;
    # The parent Comment
    Comment parent?;
    # The comment's anchor line detail
    Inline inline?;
    # links to a resource related to comment object.
    Links links?;
};

# A milestone as defined in a repository's issue tracker
public type Milestone record {
    # links to a resource related to comment object.
    Links links?;
    # The name of the milestone
    string name?;
    # The ID of the milestone
    int id?;
};

public type Title record {
    # The text as it was typed by a user
    string raw?;
    # The type of markup language the raw content is to be interpreted in
    string markup?;
    # The user's content rendered as HTML
    string html?;
};

# Base type for most resource objects. It defines the common `type` element that identifies an object's type. It also 
# identifies the element as Swagger's `discriminator`.
public type Error record {
    # The type of the error
    string 'type;
    # The error detail
    ErrorDetail _error?;
};

# The comment's anchor line detail
public type Inline record {
    # The comment's anchor line in the new version of the file. If the 'from' line is also provided, this value will be 
    # removed.
    int to?;
    # The comment's anchor line in the old version of the file.
    int 'from?;
    # The path of the file this comment is anchored to.
    string path;
};

# A paginated list of issues.
public type PaginatedIssues record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, as it 
    # can be expensive to compute
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. 
    # Individual APIs may enforce different values
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to 
    # navigate the result set and refrain from constructing your own URLs
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional 
    # element that is not provided in all responses. Some result sets strictly support forward navigation and never 
    # provide previous links. Clients must anticipate that backwards navigation is not always available. Use this link 
    # to navigate the result set and refrain from constructing your own URLs
    string previous?;
    # An array of issues
    Issue[] values?;
};

public type PullrequestBranch record {
    string name?;
    # Available merge strategies, when this endpoint is the destination of the pull request
    string[] merge_strategies?;
    # The default merge strategy, when this endpoint is the destination of the pull request
    string default_merge_strategy?;
};

# A Bitbucket project.
public type Project record {
    # links to a resource related to comment object.
    Links links?;
    # The project's immutable id
    string uuid?;
    # The project's key.
    string 'key?;
    # A team object.
    Team owner?;
    # The name of the project
    string name?;
    # The project description
    string description?;
    # Indicates whether the project is publicly accessible, or whether it is private to the team and consequently only 
    # visible to team members. Note that private projects cannot contain public repositories.
    boolean is_private?;
    # The created date/time of the project
    string created_on?;
    # The last updated date/time of the project
    string updated_on?;
};

# A ref object, representing a branch or tag in a repository
public type Ref record {
    # The type of the ref object
    string 'type;
    # links to a resource related to comment object.
    Links links?;
    # The name of the ref.
    string name?;
    # The target commit
    Commit target?;
};

# A Bitbucket repository.
public type Repository record {
    # links to a resource related to comment object.
    Links links?;
    # The repository's immutable id. This can be used as a substitute for the slug segment in URLs. Doing this 
    # guarantees your URLs will survive renaming of the repository by its owner, or even transfer of the repository to a 
    # different user
    string uuid?;
    # The concatenation of the repository owner's username and the slugified name, e.g. "evzijst/interruptingcow". This 
    # is the same string used in Bitbucket URLs
    string full_name?;
    # Indicates whether the repository is private
    boolean is_private?;
    # The parent repository
    Repository parent?;
    # source control
    string scm?;
    # The owner of the repository
    Account owner?;
    # The name of the repository
    string name?;
    # The description of the repository
    string description?;
    # The created data/time of the repository
    string created_on?;
    # The last updated date/time of the repository
    string updated_on?;
    # The size of the repository
    int size?;
    # The language of the repository
    string language?;
    # Indicates whether repository includes issues
    boolean has_issues?;
    # Indicates whether repository has a wiki
    boolean has_wiki?;
    # Controls the rules for forking this repository. ()allow_forks)-unrestricted forking (no_public_forks) - restrict 
    # forking to private forks (forks cannot be made public later) (no_forks) -deny all forking
    string fork_policy?;
    # The related project
    Project project?;
    # The main branch
    Branch? mainbranch?;
};

# A repository commit object.
public type Commit record {
    *BaseCommit;
    #The Repository of the commit
    Repository repository?;
    # The participants of the commit
    Participant[] participants?;
};

# Object describing a user's role on resources like commits or pull requests.
public type Participant record {
    # The user detail
    User user?;
    # The type of the participant
    string role?;
    # Indicates whether participant is approved
    boolean approved?;
    # The state of the participant
    string state?;
    # The ISO8601 timestamp of the participant's action. For approvers, this is the time of their approval. For 
    # commenters and pull request reviewers who are not approvers, this is the time they last commented, or null if they 
    # have not commented.
    string participated_on?;
};

# The common base type for both repository and snippet commits
public type BaseCommit record {
    # The hash value of the base commit
    string hash?;
    # The date of the base commit
    string date?;
    # The author of the base commit
    Author author?;
    # The message of the base commit
    string message?;
    # The summary of the pull request
    Summary summary?;
    # The parent base commit
    BaseCommit[] parents?;
};

# The content of the issue
public type Content record {
    # The text as it was typed by a user.
    string raw?;
    # The type of markup language the raw content is to be interpreted in.
    string markup?;
    # The user's content rendered as HTML
    string html?;
};

# A issue comment.
public type IssueComment record {
    *Comment;
    # The issue of the related commit message
    Issue issue?;
};

# links to a resource related to comment object.
public type Links record {
    # A link to comment related to this object.
    Link self?;
    # A link to html resource related to this object.
    Link html?;
    # A link to code related to this object.
    Link code?;
    # A link to commits related to this object.
    Link commits?;
    # A link to approve resource related to this object.
    Link approve?;
    # A link to a diff resource related to this object.
    Link diff?;
    # A link to diff stat resource related to this object.
    Link diffstat?;
    # A link to comments related to this object.
    Link comments?;
    # A link to a activity resource related to this object.
    Link activity?;
    # A link to a merge resource related to this object.
    Link merge?;
    # A link to a decline resource related to this object.
    Link decline?;
    # The name of the related object
    string name?;
    # A link to a avatar resource related to this object.
    Link avatar?;
    # A link to followers resource related to this object.
    Link followers?;
    # A link to following resource related to this object.
    Link following?;
    # A link to repositories resource related to this object.
    Link repositories?;
    # A link to pullrequests resource related to this object.
    Link pullrequests?;
    # A link to forks resource related to this object.
    Link forks?;
    # A link to hooks resource related to this object.
    Link watchers?;
    # A link to a resource related to this object.
    Link downloads?;
    # A link to a resource related to this object
    Clone clone?;
    # A link to a resource related to this object.
    Link hooks?;
    # A link to attachments resource related to this object.
    Link attachments?;
    # A link to watch resource related to this object.
    Link watch?;
    # A link to vote resource related to this object.
    Link vote?;
    # A link to members resource related to this object.
    Link members?;
    # A link to owners resource related to this object.
    Link owners?;
    # A link to projects resource related to this object.
    Link projects?;
    # A link to snippets resource related to this object.
    Link snippets?;
};

# The summary of the pull request
public type Summary record {
    # The text as it was typed by a user
    string raw?;
    # The type of markup language the raw content is to be interpreted in.
    string markup?;
    # The user's content rendered as HTML
    string html?;
};

# The author of a change in a repository
public type Author record {
    # The raw author value from the repository. This may be the only value available if the author does not match a user 
    # in Bitbucket
    string raw?;
    # The user details
    Account user?;
};

# Base type for most resource objects. It defines the common `type` element that identifies an object's type. It also 
# identifies the element as Swagger's `discriminator`.
public type Object record {
    # It defines the common `type` element that identifies an object's type and the element as Swagger's `discriminator`
    string 'type?;
};

# A link to a resource related to this object.
public type Link record {
    # The reference link
    string href?;
    # The name of the link
    string name?;
};

# A Bitbucket workspace.
public type Workspace record {
    # links to a resource related to comment object.
    Links links?;
    # The workspace's immutable ID
    string uuid?;
    # The name of the workspace
    string name?;
    # The short label that identifies this workspace
    string slug?;
    # Indicates whether the workspace is publicly accessible, or whether it is
    boolean is_private?;
    # The created date/time of the workspace
    string created_on?;
    # The last updated date/time of the workspace
    string updated_on?;
};

# A pull request object
public type Pullrequest record {
    # links to a resource related to comment object.
    Links links?;
    # The pull request's unique ID. Note that pull request IDs are only unique within their associated repository
    int id?;
    # Title of the pull request
    string title?;
    # User provided pull request text, interpreted in a markup language and rendered in HTML
    Rendered rendered?;
    # The summary of the pull request
    Summary summary?;
    # The pull request's current status
    string state?;
    # The author of the pull request
    Account author?;
    # The pull request source
    PullrequestEndpoint 'source?;
    #The pull request destination
    PullrequestEndpoint destination?;
    # The pull request commit
    MergeCommit? merge_commit?;
    # The number of comments for a specific pull request
    int comment_count?;
    # The number of open tasks for a specific pull request
    int task_count?;
    # A boolean flag indicating if merging the pull request closes the source branch
    boolean close_source_branch?;
    # By whom the pull request closed
    Account? closed_by?;
    # Explains why a pull request was declined. This field is only applicable to pull requests in rejected state.
    string reason?;
    # The ISO8601 timestamp the request was created
    string created_on?;
    # The ISO8601 timestamp the request was last updated
    string updated_on?;
    # The list of users that were added as reviewers on this pull request when it was created. For performance reasons, 
    # the API only includes this list on a pull request's `self` URL.
    Account[] reviewers?;
    # The list of users that are collaborating on this
    Participant[] participants?;
};

# A paginated list of pullrequests.
public type PaginatedPullrequests record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, as it 
    # can be expensive to compute.
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses.
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. 
    # Individual APIs may enforce different values.
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to 
    # navigate the result set and refrain from constructing your own URLs.
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional element 
    # that is not provided in all responses. Some result sets strictly support forward navigation and never provide 
    # previous links. Clients must anticipate that backwards navigation is not always available. Use this link to 
    # navigate the result set and refrain from constructing your own URLs.
    string previous?;
    # a List of pull request
    Pullrequest[] values?;
};
