
<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="panel widget-option">
	<a data-toggle="collapse" href="#category" data-parent="#widget-parent">Category</a>
	<div class="collapse show" id="category">
		<div class="collapse-content">

			<c:forEach items="${category}" var="c">
				
				<a href="${base }/category/${c.getSeo()}">
					<div class="single-widget-opt">
						<span>${c.name}</span>
					</div>
				</a>

			</c:forEach>

		</div>

	</div>
</div>