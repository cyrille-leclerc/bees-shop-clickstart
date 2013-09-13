<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${product.name}</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="//code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css"/>

    <script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="//code.jquery.com/ui/1.10.1/jquery-ui.js" type="text/javascript"></script>
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input#searchProduct").autocomplete({
                minLength: 2,
                source: "${pageContext.request.contextPath}/product/suggest"
            });
        });
    </script>
</head>
<body>

<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <div class="span9">
                <a class="brand" style="padding: 0; padding-top: 10px; padding-right: 5px"
                   href="${pageContext.request.contextPath}/"> <img alt='cloudbees logo' height='28'
                                                                    src='${pageContext.request.contextPath}/img/logo.png'/>
                    Bees Shop
                </a>
                <ul class="nav">
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/product/">Products</a></li>
                </ul>
                <form class="navbar-search pull-left" action="${pageContext.request.contextPath}/product/">
                    <input id="searchProduct" name="name" type="text" class="search-query input-medium"
                           placeholder="Search by name">
                </form>
            </div>
            <div class="span3 pull-right">
                <p class="nav">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/" title="Shopping Cart">
                        <i class="icon-shopping-cart"></i>
                        ${shoppingCart.itemsCount} items
                        ${shoppingCart.prettyPrice}
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="page-header">
        <h1>Amazon AWS Configuration</h1>
    </div>


    <div class="span12">
        <c:choose>
            <c:when test="${empty warningException}">
                <div class="alert alert-success">
                    Amazon AWS Configuration is valid
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-error">
                    Amazon AWS Configuration is invalid <br/>
                    <pre style="overflow-x: auto;">${warningException}</pre>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="row">
            <div class="span6">
                <form:form id="form" action="${pageContext.request.contextPath}/configuration/aws/credentials" method="put">
                <fieldset>
                    <legend>AWS Credentials</legend>
                    <div class="control-group">
                        <label class="control-label" for="awsAccessKeyId">AWS Access Key ID</label>

                        <div class="controls">
                            <input id="awsAccessKeyId" name="awsAccessKeyId" type="text" value="${awsAccessKeyId}"
                                   class="span4">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="awsSecretKey">AWS Secret Key</label>

                        <div class="controls">
                            <input id="awsSecretKey" name="awsSecretKey" type="text" value="${awsSecretKey}"
                                   class="span4">
                        </div>
                    </div>
                </fieldset>
                <div class="btn-group">
                    <button type="submit" class="btn js-btn">Save AWS Credentials</button>
                </div>
            </div>
            </form:form>
            <div class="span6">
                <form:form id="form" action="${pageContext.request.contextPath}/configuration/aws/s3" method="put">
                    <fieldset>
                        <legend>Amazon S3</legend>
                        <div class="control-group">
                            <label class="control-label" for="amazonS3BucketName">Amazon S3 Bucket</label>

                            <div class="controls">
                                <input id="amazonS3BucketName" name="amazonS3BucketName" type="text"
                                       value="${amazonS3BucketName}" class="span4">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="amazonS3BucketBasePublicUrl">Amazon S3 Bucket Base Public
                                URL
                                (can
                                be a CDN URL or the bucket URL)</label>

                            <div class="controls">
                                <input id="amazonS3BucketBasePublicUrl" name="amazonS3BucketBasePublicUrl" type="text"
                                       value="${amazonS3BucketBasePublicUrl}" class="span4">
                            </div>
                        </div>
                    </fieldset>
                    <div class="btn-group">
                        <button type="submit" class="btn js-btn">Save Amazon S3 Configuration</button>
                    </div>
                </form:form>
            </div>
        </div>

    </div>
</div>

</div>
</div>
</body>
</html>
