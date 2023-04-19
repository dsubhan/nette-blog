<?php

declare(strict_types=1);

namespace App\Model;

use Nette;


final class PostFacade
{
	use Nette\SmartObject;

	private Nette\Database\Explorer $database;


	public function __construct(Nette\Database\Explorer $database)
	{
		$this->database = $database;
	}

	/**
	 * Get article(s)
	 * @param $prihlasen bool prihlasen nebo ne
	 */
	public function getPublicArticles(bool $prihlasen)
	{

		if ($prihlasen){
			return $this->database
			->table('posts')
			->whereOr(['aktivni'=> [0, 1]])
			->where('created_at < ', new \DateTime)
			->order('created_at DESC')
			->limit(20);
		}
		else{
		return $this->database
			->table('posts')
			->where('created_at < ', new \DateTime)
			->where('aktivni =  ', 1)
			->order('created_at DESC')
			->limit(5);
		}
	}
	/**
	 * function to set post active or deactive
	 * @param int $id (id of article)
	 * @param int $status (0/1)
	 */
	public function set_post_active(int $id,int $status) {
		$result = $this->database->query('UPDATE posts SET', [
			'aktivni' => $status,
		], 'WHERE id = ?', $id);

		return $result->getRowCount();
	}

	public function render_post($id,$prihlasen){
		if ($prihlasen){
			return $test =  $this->database
			->table('posts')
			->where('id = ', $id)->fetch();
			
		}
		return $test =  $this->database
			->table('posts')
			->where('id = ', $id)
			->where('aktivni = ',1)
			->fetch();
		//return $this->database->table('posts')->get($id);
		
	}
	/**
	 * get comments from id of article
	 * @param int $post_id
	 */
	public function render_coments(int $post_id){
		return $this->database
			->table('comments')
			->where('post_id = ', $post_id)
			->order('created_at');
	}
	/**
	 * Function to find user in DB
	 * @param string $username
	 * @return null|\Nette\Database\Table\ActiveRow
	 */
	public function get_user(string $username)
	{
		return $this->database
			->table('users') 
			->where('username', $username) 
			->fetch();
	}

	/**
	 * Function to delete article + comments
	 * @param int $id (id of article)
	 * @return void
	 */
	public function delete_article(int $id){
		$this->database->query('delete from comments where post_id = ?', $id);
		$this->database->query('delete from posts where id = ?', $id);
	}

}
