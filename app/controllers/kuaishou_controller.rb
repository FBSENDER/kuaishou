require 'kuaishou'
require 'date'
class KuaishouController < ApplicationController
  def user_list
    @users = User.all
  end

  def user
    @user = User.where(source_id: params[:id].to_i).take
    not_found if @user.nil?
    @photos = Photo.where(user_source_id: @user.source_id).order("published_at desc")
  end

  def user_refresh
    @user = User.where(source_id: params[:id].to_i).take
    not_found if @user.nil?
    @user.updated_at = @user.updated_at - 2.hours
    @user.save
    render plain: "数据将在1分钟内更新"
  end

  def user_add
    id = params[:id].to_i
    not_found if id.zero?
    t = TargetUser.where(user_id: id).take
    if t.nil?
      t = TargetUser.new
      t.user_id = id
      t.save
    end
    render plain: "添加监控用户成功，数据将在1分钟内更新"
  end

  def ads
    @photos = Photo.where(is_ad: 1).order("published_at desc").to_a
    @users = User.all
  end

  def report
  end

  def set_ad
    @photo = Photo.where(photo_id: params[:id].to_i).take
    not_found if @photo.nil?
    is_ad = params[:is_ad].to_i == 1
    @photo.is_ad = is_ad ? 1 : 0
    @photo.save
    render plain: "设置成功"
  end
end
