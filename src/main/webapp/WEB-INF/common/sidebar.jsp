<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div id="sidebar" class="app-sidebar">
  <div class="app-sidebar-content" data-scrollbar="true" data-height="100%">
    <div class="menu">
      <div class="menu-profile">
        <a href="javascript:;" class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu">
          <div class="menu-profile-cover with-shadow"></div>
          <div class="menu-profile-image">
            <!-- <img src="" alt="" /> -->
          </div>
          <div class="menu-profile-info">
            <div class="d-flex align-items-center">
              <div class="flex-grow-1">CMS</div>
              <div class="menu-caret ms-auto"></div>
            </div>
            <small>Administrator</small>
          </div>
        </a>
      </div>
      <div id="appSidebarProfileMenu" class="collapse">
        <div class="menu-item pt-5px">
          <a href="javascript:;" class="menu-link">
            <div class="menu-icon"><i class="fa fa-cog"></i></div>
            <div class="menu-text">Settings</div>
          </a>
        </div>
        <div class="menu-item">
          <a href="javascript:;" class="menu-link">
            <div class="menu-icon"><i class="fa fa-pencil-alt"></i></div>
            <div class="menu-text">Send Feedback</div>
          </a>
        </div>
        <div class="menu-item pb-5px">
          <a href="javascript:;" class="menu-link">
            <div class="menu-icon">
              <i class="fa fa-question-circle"></i>
            </div>
            <div class="menu-text">Helps</div>
          </a>
        </div>
        <div class="menu-divider m-0"></div>
      </div>
      <div class="menu-header">Main menu</div>

      <!-- NCC -->
      <div class="menu-item">
        <a href="/supplier" class="menu-link">
          <div class="menu-icon">
            <i class="fa fa-globe"></i>
          </div>
          <div class="menu-text">
            Nhà cung ứng
          </div>
        </a>
      </div>
      <!-- * NCC -->
      <!-- Order -->
      <div class="menu-item">
        <a href="/order/list" class="menu-link">
          <div class="menu-icon">
            <i class="fa fa-globe"></i>
          </div>
          <div class="menu-text">
            Danh sách nhập
          </div>
        </a>
      </div>
      <!-- * Order -->

      <div class="menu-item d-flex">
        <a href="javascript:;" class="app-sidebar-minify-btn ms-auto d-flex align-items-center text-decoration-none" data-toggle="app-sidebar-minify" ><i class="fa fa-angle-double-left"></i></a>
      </div>
    </div>
  </div>
</div>
<div class="app-sidebar-bg"></div>
<div class="app-sidebar-mobile-backdrop">
  <a href="#" data-dismiss="app-sidebar-mobile" class="stretched-link"></a>
</div>
