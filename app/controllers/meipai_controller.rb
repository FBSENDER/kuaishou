require 'meipai'
require 'date'
class MeipaiController < ApplicationController
  def user_list
    @users = MUser.order("id desc")
  end

  def user
    @user = MUser.where(source_id: params[:id].to_i).take
    not_found if @user.nil?
    @photos = MPhoto.where(user_source_id: @user.source_id).order("published_at desc")
  end

  def user_refresh
    @user = MUser.where(source_id: params[:id].to_i).take
    not_found if @user.nil?
    @user.updated_at = @user.updated_at - 2.hours
    @user.save
    render plain: "数据将在1分钟内更新"
  end

  def user_add
    idd = params[:id]
    id = idd.to_i
    if(idd.match(/user\/\d+/))
      id = idd.match(/user\/(\d+)/)[1].to_i
    elsif(idd.match(/media\/\d+/))
      ad_id = idd.match(/media\/(\d+)/)[1].to_i
    end

    not_found if id.zero? && ad_id.zero?
    if id > 0
      t = MTargetUser.where(user_id: id).take
      if t.nil?
        t = MTargetUser.new
        t.user_id = id
        t.save
      end
    elsif ad_id > 0
      t = MTargetUser.where(ad_source_id: ad_id).take
      if t.nil?
        t = MTargetUser.new
        t.ad_source_id = ad_id
        t.save
      else
        t.ad_source_id = ad_id
        t.save
      end
    end
    render plain: "添加监控用户成功，数据将在1分钟内更新"
  end

  def ads
    @photos = MPhoto.where(is_ad: 1).order("published_at desc").to_a
    @users = MUser.all
  end

  def report
  end

  def set_ad
    @photo = MPhoto.where(photo_id: params[:id].to_i).take
    not_found if @photo.nil?
    is_ad = params[:is_ad].to_i == 1
    @photo.is_ad = is_ad ? 1 : 0
    @photo.save
    render plain: "设置成功"
  end
end
