<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<div class="page-content">
	<div class="page-header">
		<h1>
			权限管理
			<small>
				<i class="icon-double-angle-right"></i>
				权限分配
			</small>
		</h1>
	</div><!-- /.page-header -->

	<div class="row">
		<div class="col-sm-12">
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs" id="myTab3">
					<li class="active">
						<a data-toggle="tab" href="#home3">
							<i class="blue icon-user bigger-110"></i>
							张三
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#profile3">
							<i class="blue icon-user bigger-110"></i>
							李四
						</a>
					</li>

					<li>
						<a data-toggle="tab" href="#dropdown13">
							<i class="blue icon-user bigger-110"></i>
							admin
						</a>
					</li>
				</ul>

				<div class="tab-content">
					<div id="home3" class="tab-pane in active">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="row header smaller lighter orange">
									<span class="col-sm-8">
										<i class="icon-bell-alt"></i>
										选中则拥有此模块权限
									</span><!-- /span -->

									<span class="col-sm-4">
										<label class="pull-right inline">
											<small class="muted">该用户是否启用:</small>

											<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5" />
											<span class="lbl"></span>
										</label>
									</span><!-- /span -->
								</h3>
							</div>
						</div>
						<div class="row">
						</div>
					</div>

					<div id="profile3" class="tab-pane">
						<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>

					<div id="dropdown13" class="tab-pane">
						<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.row -->
</div><!-- /.page-content -->
