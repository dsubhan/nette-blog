<?php 
declare(strict_types=1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use App\Model\PostFacade;

final class PostPresenter extends Nette\Application\UI\Presenter
{

	private $database;
	private PostFacade $facade;
	private $id_post = null;

	public function __construct(Nette\Database\Context $database, PostFacade $facade)
	{
			$this->database = $database;
			$this->facade = $facade;
	}

	//id z routu
	public function renderShow(int $postId): void
	{
		$this->id_post = $postId;
		$post = $this->facade->render_post($postId, $this->getUser()->isLoggedIn());
		if (!$post) {
			$this->error('Post not found', 404);
		}
		$this->template->post = $post;
		$this->template->comments = $this->facade->render_coments($postId);
	}

	protected function createComponentCommentForm(): Form
	{
		$form = new Form;
		$form->addText('name', 'Jméno:')
			->setRequired();

		$form->addEmail('email', 'Email:');

		$form->addTextArea('content', 'Komentář:')
			->setRequired();

		$form->addSubmit('send', 'Odeslat komentář');
		$form->onSuccess[] = [$this, 'commentFormSucceeded'];

		return $form;
	}

	public function commentFormSucceeded(\stdClass $data): void
	{
		$this->database->table('comments')->insert([
			'post_id' => $this->getParameter('postId'),
			'name' => $data->name,
			'email' => $data->email,
			'content' => $data->content,
		]);

		$this->flashMessage('Thank you for your comment', 'success');
		$this->redirect('this');
	}

	protected function createComponentPostActive(): Form
	{
		$form = new Form;
		$active = [
			'1' => 'aktivní',
			'0' => 'neaktivní',
		];

		$form->addSelect('active', 'Změna:', $active);
		$form->addInteger('id', 'id')
			->setDefaultValue($this->id_post)
			->setRequired()
			->setOption('class', 'hide');

		$form->addSubmit('send', 'Uložit');
		$form->onSuccess[] = [$this, 'set_post_active'];
		return $form;
	}

	public function actionDelete(int $id) :void{
		die;
	}

	/**
	 * Funkce pro aktiovaci/deaktivaci příspěvku
	 */
	public function set_post_active(\stdClass $data)
	{
		/**
		 * Jen admin user může zveřejnit příspěvky
		 */
		if ($this->user->getIdentity()->getRoles()[0] != 'admin'){
			$this->flashMessage('Nemáte přístupová práva', 'success');
			$this->redirect('this');
			exit(0);
		}

		/**try catch jak? + jak efektivneji dostgat id?? */
		$e = $this->facade->set_post_active(intval($data->id), $data->active);
		if ($e == 0) {
			$this->flashMessage('Něco se nepovedlo', 'success');
			$this->redirect('this');
		}
		$this->flashMessage('Aktualizováno', 'success');
		$this->redirect('this');
		
	}
	
}
